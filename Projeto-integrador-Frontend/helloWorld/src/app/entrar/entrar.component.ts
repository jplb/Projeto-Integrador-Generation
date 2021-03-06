import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserLogin } from '../Model/UserLogin';
import { AuthService } from '../service/auth.service';

@Component({
  selector: 'app-entrar',
  templateUrl: './entrar.component.html',
  styleUrls: ['./entrar.component.css']
})
export class EntrarComponent implements OnInit {

  userLogin: UserLogin = new UserLogin()

  constructor(
    private auth: AuthService,
    private router: Router

  ) { }

 

  ngOnInit() {
    window.scroll
  }



  entrar(){
    this.auth.entrar(this.userLogin).subscribe((resp: UserLogin)=>{
    this.userLogin = resp

    this.router.navigate(['/inicio'])
  }, erro =>{
    if(erro.status == 500){
      alert('Usuário e senha inválido')
    }

  })

  }
    

}
