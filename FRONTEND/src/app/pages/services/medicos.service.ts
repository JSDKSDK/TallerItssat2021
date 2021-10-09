import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { HttpClientService } from 'src/app/implementation/http-client.service';
import { environment } from 'src/environments/environment';
import { VariablesGLService } from './variables-gl.service';

@Injectable({
  providedIn: 'root'
})
export class MedicosService {

  countMedicos =  new BehaviorSubject <number> (0);
  constructor(
    private http: HttpClientService
  ) { }


  getcountmedicos(){
    this.http.get(`${environment.urlApi}medicos/getcountmedicos`)
    .subscribe(
      (res: number) => {
        if (res){
        this.countMedicos.next(res);
        }
      }
    );

  }
}
