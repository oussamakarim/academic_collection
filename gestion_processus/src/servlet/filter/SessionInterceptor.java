package servlet.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionInterceptor implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        /* Cast des objets request et response */
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        /* Récupération de la session depuis la requête */
        HttpSession session = request.getSession();
        /**
         * Si l'objet utilisateur n'existe pas dans la session en cours, alors
         * l'utilisateur n'est pas connecté.
         */
        if (session.getAttribute("user") == null) {
            /* Redirection vers la page du connextion */
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
//            requestDispatcher.forward(request, response);
            response.sendRedirect("login");
        } else {
            /* Affichage de la page restreinte */
            filterChain.doFilter(request, response);
        }
    }
}
