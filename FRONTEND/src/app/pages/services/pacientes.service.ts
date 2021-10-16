import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { HttpClientService } from 'src/app/implementation/http-client.service';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PacientesService {

  countpacientes= new BehaviorSubject <number> (0);
  constructor(
    private http: HttpClientService
  ) { }


getcountpacientes(){

  this.http.get(`${environment.urlApi}pacientes/getcountpacientes`)
  .subscribe(
    (respuesta:number)=>{
      if (respuesta) {
        this.countpacientes.next(respuesta);
      }
    }
    );


}



}
