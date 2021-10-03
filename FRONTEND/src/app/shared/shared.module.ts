import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { MenuComponent } from './components/menu/menu.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { SideuserComponent } from './components/sideuser/sideuser.component';
import { ContenidoComponent } from './components/contenido/contenido.component';
import { Componente1Component } from './components/pruebas/componente1/componente1.component';
import { Componente2Component } from './components/pruebas/componente2/componente2.component';
import { Componente3Component } from './components/pruebas/componente3/componente3.component';
import { BreadcrumbComponent } from './components/breadcrumb/breadcrumb.component';



@NgModule({
    declarations: [
    MenuComponent,
    NavbarComponent,
    SideuserComponent,
    ContenidoComponent,
    Componente1Component,
    Componente2Component,
    Componente3Component,
    BreadcrumbComponent
  ],
    imports: [
      CommonModule,
      RouterModule,
      
    ],
    exports: [
      MenuComponent,
      NavbarComponent,
      SideuserComponent,
      ContenidoComponent,
      Componente1Component,
      Componente2Component,
      Componente3Component
    ],
  })
  export class SharedModule { }
  