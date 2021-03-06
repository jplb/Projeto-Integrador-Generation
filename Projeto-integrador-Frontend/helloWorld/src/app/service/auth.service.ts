import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { User } from '../Model/User';
import { UserLogin } from '../Model/UserLogin';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(
    private http: HttpClient
  ) { }

  entrar(userLogin: UserLogin) : Observable<UserLogin>{
    return this.http.post<UserLogin>('https://hw-tshirts.herokuapp.com/usuario/logar',userLogin)
  }

  cadastrar(user: User) : Observable<User>{
    return this.http.post<User>('https://hw-tshirts.herokuapp.com/usuario/cadastrar',user)
  }

}
