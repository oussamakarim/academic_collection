package servlet;

import metier.beans.Etape;
import metier.beans.Rapport;
import metier.enumeration.EtatEtape;
import metier.gestionnaire.GestionnaireEtape;
import metier.gestionnaire.GestionnaireRapport;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@MultipartConfig
public class JustifierRapport extends HttpServlet {
    private final String path = "/tmp/";
    private GestionnaireRapport gestionnaireRapport = new GestionnaireRapport();
    private GestionnaireEtape gestionnaireEtape = new GestionnaireEtape();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String file;
        Integer idEtape = Integer.parseInt(req.getParameter("id"));
        EtatEtape decision = EtatEtape.valueOf(req.getParameter("decision"));


        if (req.getPart("files").getSize() > (1024 * 1024 * 100)) {
            showMessage(req, resp, "danger", "Max Size of File 100M", "/pages/msg.jsp");
        } else {
            Etape etape = gestionnaireEtape.getById(idEtape);
            etape.getEtapeEntity().setEtat(decision);
            gestionnaireEtape.update(etape);
            file = upload(req.getPart("files"), req);
            Rapport rapport = gestionnaireRapport.newInstance(file, decision, idEtape);
            if (gestionnaireRapport.save(rapport) != null) {
                resp.sendRedirect("employe");
//                RequestDispatcher dispatcher = req.getRequestDispatcher("employe");
//                dispatcher.forward(req, resp);
            } else {
                showMessage(req, resp, "danger", "Erreur lors d'importation de rapport", "/pages/msg.jsp");
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
        Etape etape = gestionnaireEtape.getById(Integer.parseInt(request.getParameter("id")));
        String newName = etape.getLibelle() + "_" + etape.getId() + "_" + System.currentTimeMillis() + extention(part);
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
