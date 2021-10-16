import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { MedicosService } from '../services/medicos.service';
import { PacientesService } from '../services/pacientes.service';


@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit,OnDestroy {

  countmedicosSuscription: Subscription = new Subscription();
  countpacientesSuscription: Subscription = new Subscription();


  countmedicos:number=0;
  countpacientes:number=0;
  constructor(
    private medicosService: MedicosService,
    private pacientesService: PacientesService
  ) { this.countmedicosSuscription = this.medicosService.countMedicos.subscribe((value)=>{
    if (value) {
      this.countmedicos=value;
    }
  });
  this.countpacientesSuscription = this.pacientesService.countpacientes.subscribe((value)=>{
    if (value) {
      this.countpacientes=value;
    }else{
      this.pacientesService.getcountpacientes();
    }
  })

}

  ngOnInit() {
    this.medicosService.getcountmedicos();

 
  }
  ngOnDestroy() {
    if (this.countmedicosSuscription) {
      this.countmedicosSuscription.unsubscribe();
    }

    if (this.countpacientesSuscription) {
      this.countpacientesSuscription.unsubscribe();
    }



  }
}
