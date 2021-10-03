import { Routes, RouterModule } from "@angular/router";
import { AuthGuard } from "src/config/auth.guard";
import { Componente1Component } from "../shared/components/pruebas/componente1/componente1.component";
import { Componente2Component } from "../shared/components/pruebas/componente2/componente2.component";
import { Componente3Component } from "../shared/components/pruebas/componente3/componente3.component";
import { DashboardComponent } from "./dashboard/dashboard.component";
import { LoginComponent } from "./login/login.component";
import { PagesComponent } from "./pages.component";



const pagesRoutes: Routes=[
    {
        path:'',
        component: PagesComponent,
        // canActivate: [AuthGuard],
        children: [
            {path: '', component: DashboardComponent, data: { titulo: 'Pagina de inicio'}},
            {path: 'componente1', component: Componente1Component, data: { titulo: ' componente1'}},
            {path: 'componente2', component: Componente2Component, data: { titulo: ' componente2'}},
            {path: 'componente3', component: Componente3Component, data: { titulo: ' componente3'}},
        ]
    },
    {
        path: 'login',
        component: LoginComponent
    }
]

export const PagesComponentsRoutes = RouterModule.forChild(pagesRoutes);