import { Injectable } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { ConfigService } from 'src/config/config.service';


@Injectable({
  providedIn: 'root'
})
export class AppService {

  constructor(

    private router: Router,
    private config: ConfigService
  ) {
   this.config.setLocal();
    this.router.events
      .pipe(filter(d => d instanceof NavigationEnd))
      .subscribe((d: any) => {
        if (d.url == '/') {
  
         }
      })
  }
}
