import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PagesComponent } from './pages.component';
import { LoginComponent } from './login/login.component';
import { PagesComponentsRoutes } from './pages.routes';
import { SharedModule } from '../shared/shared.module';
import { DashboardComponent } from './dashboard/dashboard.component';


@NgModule({
    declarations: [
    PagesComponent,
    LoginComponent,
    DashboardComponent
    ],
    exports:[],
    imports: [
      CommonModule,
      PagesComponentsRoutes,
      SharedModule,
    
    ]
  
  })
  export class PagesModule { }