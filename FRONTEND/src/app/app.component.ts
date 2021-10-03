import { Component } from '@angular/core';
import { AppService } from './pages/services/app.service';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(appService:AppService,
    ){
    }
}
