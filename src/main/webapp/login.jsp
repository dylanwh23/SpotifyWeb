<%-- 
    Document   : index
    Created on : Oct 4, 2024, 1:33:48?AM
    Author     : dylan
--%>

<%@page import="webServices.UsuarioController"%>
<%@page import="webServices.UsuarioControllerService"%>
<%@page import="Utilidades.controlIngresos"%>
<%
    controlIngresos controlIngresos = new controlIngresos();
    UsuarioControllerService IUCservicio = new UsuarioControllerService();
    UsuarioController usrController = IUCservicio.getUsuarioControllerPort(); 
    usrController.autenticarUsuario(controlIngresos.obtenerIpActual(), 
    controlIngresos.obtenerUrlActual(request), controlIngresos.obtenerNavegadorActual(request), controlIngresos.obtenerSistemaOperativoActual(request));
    
    
    if (session == null || session.getAttribute("nick") == null) {        
    }else{
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Spotify</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="includes/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://rsms.me/inter/inter.css">

    </head>
    <body class="">
        <section class="indexdiv bg-gray-900">
            <div class="flex flex-col items-center md:justify-center px-6 pt-16 md:py-8 mx-auto h-screen">
                <a href="#" class="z-10 flex items-center mb-16 md:mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
                    <img class="w-16 h-16 mr-2" src="https://cdn.freebiesupply.com/logos/large/2x/spotify-2-logo-png-transparent.png" alt="logo">
                        Spotify
                </a>
                <div class="z-10 w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                    <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                        <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                            Ingrese a su cuenta
                        </h1>
                        <form class="space-y-4 md:space-y-6" action="verify" method="POST">
                            <div>
                                <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Ingrese su nombre de usuario o correo</label>
                                <input type="text" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="xxxx@xxxx.com" required="">
                            </div>
                            <div>
                                <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Contrase�a</label>
                                <input type="password" name="password" id="password" placeholder="******" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required="">
                            </div>
                            <div class="flex items-center justify-between">
                                <div class="flex items-start">
                                    <div class="flex items-center h-5">
                                      <input id="remember" aria-describedby="remember" type="checkbox" class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800">
                                    </div>
                                    <div class="ml-3 text-sm">
                                      <label for="remember" class="text-gray-500 dark:text-gray-300">Recuerdame</label>
                                    </div>
                                </div>
                                <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Olvid� su contrase�a?</a>
                            </div>
                            <button type="submit" class="w-full text-white bg-green-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Iniciar sesi�n</button>
                            <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                                No tiene su cuenta a�n? <a href="register.jsp" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Registrese</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
