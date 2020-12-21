package servlet.api;

import metier.beans.Demande;
import metier.beans.Document;
import metier.beans.Etape;
import metier.beans.Rapport;
import metier.gestionnaire.GestionnaireDemande;
import metier.gestionnaire.GestionnaireDocument;
import metier.gestionnaire.GestionnaireRapport;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

public class ApiDemandeFileUpload  extends HttpServlet {
    String path;
    GestionnaireDemande gestionnaireDemande;
    GestionnaireDocument gestionnaireDocument;

    @Override
    public void init() throws ServletException {
        super.init();
        path = "/tmp/";
        gestionnaireDemande = new GestionnaireDemande();
        gestionnaireDocument = new GestionnaireDocument();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jeton = req.getParameter("jeton");
        System.out.println("Jeton : " + jeton);
        Demande demande = gestionnaireDemande.getByJeton(jeton.trim());
        if ( demande == null )
            showMessage(req, resp, "danger", "Demande Introuvable", "/pages/msg.jsp");

        Document doc = gestionnaireDocument.newInstance("test0.txt", demande.getId());

        if (req.getPart("files").getSize() > (1024 * 1024 * 100)) {
            showMessage(req, resp, "danger", "Max Size of File 100M", "/pages/msg.jsp");
        } else {
            String file = upload(req.getPart("files"), req);
            if (gestionnaireDocument.save(doc) != null) {
                resp.sendRedirect("follow");
//                RequestDispatcher dispatcher = req.getRequestDispatcher("employe");
//                dispatcher.forward(req, resp);
            } else {
                showMessage(req, resp, "danger", "Erreur lors d'importation du document ", "/pages/msg.jsp");
            }
        }
    }

    private void showMessage(HttpServletRequest req, HttpServletResponse resp, String typeMessage, String message, String s) throws ServletException, IOException {
        req.setAttribute("typeMessage", typeMessage);
        req.setAttribute("msg", message);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(s);
        requestDispatcher.forward(req, resp);
    }


    private String upload(Part part, HttpServletRequest request) throws IOException {
        // creates the save directory if it does not exists
        File fileSaveDir = new File(path);
        if (! fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        // rename file
        Demande demande = gestionnaireDemande.getByJeton(request.getParameter("jeton"));
        String newName = demande.getLibelle() + "_" + demande.getId() + "_" + System.currentTimeMillis() + extention(part);
        System.out.println("new Name is " + newName);
        BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path + newName));
        byte[] bytes = new byte[1024];
        int oneByte;
        while ((oneByte = bis.read(bytes)) != - 1)
            bos.write(oneByte);
        bis.close();
        bos.close();
        return path + newName;
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    private String extention(Part part) {
        return extractFileName(part).substring(extractFileName(part).indexOf("."));
    }
}
