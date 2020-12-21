package servlet;

import metier.beans.Client;
import metier.beans.Demande;
import metier.gestionnaire.GestionnaireClient;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FollowDemande extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jeton = req.getParameter("jeton");
        String cin = req.getParameter("cin");
        Boolean validation = validateInput(cin, jeton);

        if ( validation ){
            // get processus and client
            GestionnaireClient gestionnaireClient = new GestionnaireClient();
            Client client = gestionnaireClient.getByCin(cin);
            Demande demande = client.getDemandeByJeton(jeton);

            // set Attribue for jsp
            req.setAttribute("client", client);
            req.setAttribute("demande", demande);

            // forward request
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/client.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            // forward to home page
            String errorMessage = "Desole, votre Demande n'existe pas";
            req.setAttribute("errorMessage", errorMessage);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/msg.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    private Boolean validateInput(String cin, String jeton) {
        if ( cin.length() == 0 || jeton.length() == 0)
            return false;
        GestionnaireClient gestionnaireClient = new GestionnaireClient();
        Client client = gestionnaireClient.getByCin(cin);
        if ( client != null ){
            Demande demande = client.getDemandeByJeton(jeton);
            return (demande != null);
        }
        return false;
    }
}
