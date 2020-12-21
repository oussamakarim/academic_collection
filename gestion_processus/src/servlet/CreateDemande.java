package servlet;

import metier.beans.CatalogueProcessus;
import metier.beans.Client;
import metier.beans.Demande;
import metier.beans.Document;
import metier.gestionnaire.GestionnaireCatProc;
import metier.gestionnaire.GestionnaireClient;
import metier.gestionnaire.GestionnaireDemande;
import metier.gestionnaire.GestionnaireDocument;
import util.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@MultipartConfig
//        (fileSizeThreshold = 1024 * 1024 * 2, // 2MB
//        maxFileSize = 1024 * 1024 * 100,      // 100MB
//        maxRequestSize = 1024 * 1024 * 50)
public class CreateDemande extends HttpServlet {
    private final String path = "/tmp/";
    private GestionnaireDemande gestionnaireDemande = new GestionnaireDemande();
    private GestionnaireClient gestionnaireClient = new GestionnaireClient();
    private GestionnaireCatProc gestionnaireCatProc = new GestionnaireCatProc();
    private GestionnaireDocument gestionnaireDocument = new GestionnaireDocument();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nom, prenom, cin, file, jeton, message;
        Integer idCatalogueProcessus;
        Integer idchef, idclient,idDemande;
        CatalogueProcessus processus;
        Demande demande;
        Document document;

        if (req.getPart("file").getSize() > (1024 * 1024 * 100)) {
            message = "La taille de fichier est longue";
            showMessage(req, resp, "danger", message, "/pages/msg.jsp");
        } else {
            //recuperer les donnees du formulaire
            nom = req.getParameter("nom");
            prenom = req.getParameter("prenom");
            cin = req.getParameter("cin");
            idCatalogueProcessus = Integer.parseInt(req.getParameter("catalogue"));
            file = upload(req.getPart("file"), req);
            jeton = Util.generateJeton();

            //test si le client exist (si il exist la demande va etre creer automatiquement)
            //Sinon le client va etre creer dans la bd
            idclient = getInClient(nom, prenom, cin);
            processus = gestionnaireCatProc.getById(idCatalogueProcessus);
            idchef = processus.getCatalogueProcessusEntity().getChefDefaut();
            demande = gestionnaireDemande.newInstance(idclient, idchef, processus.getCatalogueProcessusEntity().getId(), jeton);

            if ((idDemande = gestionnaireDemande.save(demande)) != null) {
                //creation du object document
                document = gestionnaireDocument.newInstance(file, idDemande);
                gestionnaireDocument.save(document);
                //response
                message = "Votre ID de cette demande est : \n" + jeton;
                showMessage(req, resp, "success", message, "/pages/msg.jsp");
            } else {
                message = "Un erreur a etait generer lors de creation du demande ,essaie une autre fois";
                showMessage(req, resp, "erreur", message, "/pages/msg.jsp");
            }
        }
    }

    private void showMessage(HttpServletRequest req, HttpServletResponse resp, String typeMessage, String message, String s) throws ServletException, IOException {
        req.setAttribute("typeMessage", typeMessage);
        req.setAttribute("msg", message);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(s);
        requestDispatcher.forward(req, resp);
    }

    private Integer getInClient(String nom, String prenom, String cin) {
        Integer idclient;
        Client client = gestionnaireClient.getByCin(cin);
        if ((client) == null) {
            //creer un Object client
            Client client1 = gestionnaireClient.newInstance(cin, nom, prenom);
            idclient = gestionnaireClient.save(client1);
        } else {
            idclient = client.getId();
        }
        return idclient;
    }

    private String upload(Part part, HttpServletRequest request) throws IOException {
        // creates the save directory if it does not exists
        File fileSaveDir = new File(path);
        if (! fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        // rename file
        String newName = request.getParameter("cin") + "_" + request.getParameter("nom") + extention(part);
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
