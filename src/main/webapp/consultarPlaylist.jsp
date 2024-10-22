<%-- 
    Document   : consultaPlaylist
    Created on : 20 oct 2024, 2:45:26 a.m.
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.IPlaylistController"%>
<%@page import="controllers.IAlbumController" %>
<%@page import="java.util.List"%>
<%@page import="controllers.IUsuarioController"%>
<%@page import="controllers.Fabrica"%>

<% 
Fabrica fabrica = Fabrica.getInstance();
IUsuarioController usrController = fabrica.getIUsuarioController();
IPlaylistController playController = fabrica.getIPlaylistController();
IAlbumController albController = fabrica.getIAlbumController();

String imagenDefault = "includes/asdasd.jpg";
String usuarioLogueado = session.getAttribute("nick").toString();

int idPlaylist = Integer.parseInt(request.getParameter("user"));
Object[][] datosCan = playController.obtenerDatosCancionesPlaylist(idPlaylist);
Object[][] datos = playController.obtenerPlaylistLista(idPlaylist);


String titulo = "Nombre";
String propietario = "Apellido";
String tipo = "Apellido";

String imagenPlay = imagenDefault;

if (datos.length > 0) {
     titulo = (String) datos[0][2];
     tipo = (String) datos [0][3];
     propietario = (String) datos [0][6];
     imagenPlay = (String) datos[0][0];
    if(imagenPlay == null || imagenPlay == "" || imagenPlay == "null" || imagenPlay.isEmpty() || "null".equals(imagenPlay)){
        imagenPlay = imagenDefault;
    } 
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
        <script src="includes/script.js"></script>
        <!-- Importar la librería Color Thief -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/color-thief/2.3.0/color-thief.umd.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body class="">
        <div name="divPlay" id="divPLaylistPrincipal" class=" text-white w-full  rounded flex"> 
            <div class="image-container flex min-h-32 min-w-32 max-h-64 max-w-64 m-6 w-1/3 h-1/3">
                <img name="imagenPLaylistPrincipal" onclick="convertirRutaAUrl("<%= imagenPlay %>") id="imagenPLaylistPrincipal" crossorigin="anonymous" style="-webkit-box-shadow: 0px 0px 32px -11px rgba(0,0,0,1); -moz-box-shadow: 0px 0px 32px -11px rgba(0font-bold text-white,0,0,1); box-shadow: 0px 0px 32px -11px rgba(0,0,0,1); border-radius: 0.5rem;" src="<%= imagenPlay %>" alt="alt" class=" min-h-32 min-w-32 max-h-64 max-w-64 size-full aspect-square shadow shadow-black "/>
            </div> 
            <div class="mt-5">
                <div  name="textoLibreria" class="h-2/3 flex flex-col justify-center overflow-hidden">
                    <h4>Playlist <%= tipo %></h4>
                    <h2 style="font-size: clamp(20px, 5vw, 110px);" class=" Class leading-none font-bold "><%= titulo%> </h2>
                </div>
                <div name="masInfoPlay" class="flex  pt-5 pb-5 ">
                    <img src="includes/posi.jpg" class=" rounded-full h-7 w-7 bg-white mr-2" alt="alt"/><a onclick='abrirCasoDeUso("consultarUsuario.jsp", "<%= propietario%>");' class=" hover:underline text-white cursor-pointer pr-2 "> <p class="decoration-1"> <%= propietario%></p></a> <h3> ・ 29 Canciones</h3>
                </div>
            </div>
        </div>
        <div style="margin-bottom: -230px;" id="PlaylistAbajo" class="flex flex-row min-h-80 w-full  ">
            <div class=" text-white flex flex-row min-h-20 mb-4 max-h-20 w-2/3 text-4xl  h-1/6">
                <img src="includes/playP.png" class="rounded-full h-16 w-16 m-8 mt-5 ml-6 mr-3" alt="alt"/>
                <i class="fa-solid  fa-shuffle   ml-4  mt-9" ></i>
                <i class="fa-solid fa-circle-plus  ml-5  mt-9" ></i>
                <i class="fa-regular fa-circle-down ml-5  mt-9"></i>
            </div>
            <div class=" text-white flex  min-h-20 mb-4 max-h-20 w-1/3 text-4xl text-right">
                <i class="fa-solid fa-magnifying-glass ml-5  mt-9  "></i>
            </div>
</div>
                <div  class="flex flex-col m--10">
                <div class="">
                    <div class="inline-block min-w-full py-2 sm:px-6 lg:px-7">
                        <div class="overflow-hidden">
                            <table
                                class="min-w-full text-left text-sm font-light text-surface dark:text-white">
                                <thead
                                    class="border-b border-neutral-200 font-medium dark:border-white/10">
                                    <tr>
                                        <th scope="col" class="flex max-w-8 mt-3 px-6 py-1">#</th>
                                        <th scope="col" class="px-6 py-4">Titulo</th>
                                        <th scope="col" class="px-6 py-4">Album</th>
                                        <th scope="col" class="px-6 py-4">Duracion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (int i = 0; i < datosCan.length; i++) {

                                    %>
                                    <tr style="border-radius: 16px; " class=" max-h-9 flex-row hover:bg-neutral-600/50  hover:rounded-md " onclick="reproducirCancion('<%= datosCan[i][3]%>')">
                                        <td class="flex max-w-5 px-6 py-1 text-xl">
                                            <div class="flex flex-row items-center space-y-2">
                                                <span><%= i+1%></span>
                                                <img src="<%= datosCan[i][4]%>" alt="Imagen" class=" min-w-16 ml-4 h-16 rounded-xl p-1.5"/>
                                            </div>
                                        </td>

                                        <td class="  px-20 py-4"><p style="font-size: clamp(12px, 1vw, 20px);" class="Class leading-nonetext-xl font-bold"><%  out.print(datosCan[i][1]); %></p><a onclick='abrirCasoDeUso("consultarUsuario.jsp", "<%= datosCan[i][8]%>");' class=" hover:underline text-white cursor-pointer pr-2 "><p><%= datosCan[i][7]%></p></a></td>
                                <td class="whitespace-nowrap px-6 py-4 hover:underline"><%= datosCan[i][6]%></td>
                                <td class="whitespace-nowrap px-6 py-4"><%= datosCan[i][2]%></td>
                                </tr>
                                <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </div>

    </div>
</body>
</html>