import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { MedicosService } from '../services/medicos.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit,OnDestroy {

  countmedicosSuscription: Subscription = new Subscription();
  countmedicos:number=0;
  constructor(
    private medicosService: MedicosService
  ) { this.countmedicosSuscription = this.medicosService.countMedicos.subscribe((value)=>{
    if (value) {
      this.countmedicos=value;
    }
  })}

  ngOnInit() {
    this.medicosService.getcountmedicos();
  }
  ngOnDestroy() {
    if (this.countmedicosSuscription) {
      this.countmedicosSuscription.unsubscribe();
    }
  }
}
