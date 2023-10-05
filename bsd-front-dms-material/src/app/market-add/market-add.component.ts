import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Util } from 'app/util';
import { Title } from '@angular/platform-browser';
import { PostMarketAddRequest } from 'app/services/market/postmarketaddrequest';
import { PostMarketAddResponse } from 'app/services/market/postmarketaddresponse';
import { MarketService } from 'app/services/market/market.service';
import { GetMarketListRequest } from 'app/services/market/getmarketlistrequest';
import { GetMarketListResponse } from 'app/services/market/getmarketlistresponse';

@Component({
  selector: 'app-market-add',
  templateUrl: './market-add.component.html',
})
export class MarketAddComponent implements OnInit {
  clicked = false;
  util: Util = new Util();
  postMarketAddRequest: PostMarketAddRequest = new PostMarketAddRequest();
  postMarketAddResponse: PostMarketAddResponse = new PostMarketAddResponse();  
  getMarketListRequest: GetMarketListRequest = new GetMarketListRequest();
  getMarketListResponse: GetMarketListResponse = new GetMarketListResponse();
  role: string[];

  constructor(
    private router: Router,
    private titleService: Title,
    private marketService: MarketService
  ) { }

  ngOnInit() {
    this.titleService.setTitle('DMS - Market Add');

    this.role = ['ADMIN', 'PRINCIPAL', 'DISTRIBUTOR', 'SUBDIST', 'GROSIR', 'MOTORIST'];

    this.marketService.getMarketListByRole('ADMIN', this.getMarketListRequest)
      .subscribe(
        successResponse => {
          this.getMarketListResponse = successResponse;
        },
        errorResponse => {          
          this.getMarketListResponse = new GetMarketListResponse();          
        }
      );
  }

  save() {
    this.clicked = !this.clicked;

    this.marketService.postMarketAdd(this.postMarketAddRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.postMarketAddResponse = successResponse;

          this.util.showNotification('info', 'top', 'center', this.postMarketAddResponse.message);

          this.postMarketAddRequest = new PostMarketAddRequest();
        },
        errorResponse => {
          this.clicked = !this.clicked;

          if (errorResponse.error.status === 400) {
            let message = "";

            for (let i = 0; i < errorResponse.error.errors.length; i++) {
              message = message + errorResponse.error.errors[i].defaultMessage + "<br>";
            }           

            this.util.showNotification('danger', 'top', 'center', message);
          } else if (errorResponse.error.status === 403) {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);

            this.router.navigate(['/user-login']);
          } else {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);
          }
        }
      );
  }

  back() {
    this.router.navigate(['/market']);
  }
}
