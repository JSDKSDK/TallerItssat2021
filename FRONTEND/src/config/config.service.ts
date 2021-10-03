import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ConfigService {
  headers = new BehaviorSubject<string>('');
  constructor() { }

  setLocal() {
    let headers:any = { 'Content-Type': 'application/json' };
    let token = this.token;

    if (token) headers['Authorization'] = `Bearer ${token}`;
    this.headers.next(headers);
  }

  get token() {
    return localStorage.tokenAdmin;
  }

}
