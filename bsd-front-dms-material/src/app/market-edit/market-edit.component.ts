import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { Util } from 'app/util';
import { Title } from '@angular/platform-browser';
import { PostMarketEditRequest } from 'app/services/market/postmarketeditrequest';
import { PostMarketEditResponse } from 'app/services/market/postmarketeditresponse';
import { GetMarketRequest } from 'app/services/market/getmarketrequest';
import { GetMarketResponse } from 'app/services/market/getmarketresponse';
import { MarketService } from 'app/services/market/market.service';
import { PostMarketDeleteRequest } from 'app/services/market/postmarketdeleterequest';
import { PostMarketDeleteResponse } from 'app/services/market/postmarketdeleteresponse';
import { GetMarketListRequest } from 'app/services/market/getmarketlistrequest';
import { GetMarketListResponse } from 'app/services/market/getmarketlistresponse';

@Component({
  selector: 'app-market-edit',
  templateUrl: './market-edit.component.html',
})
export class MarketEditComponent implements OnInit {
  clicked = false;
  util: Util = new Util();
  postMarketEditRequest: PostMarketEditRequest = new PostMarketEditRequest();
  postMarketEditResponse: PostMarketEditResponse = new PostMarketEditResponse();
  postMarketDeleteRequest: PostMarketDeleteRequest = new PostMarketDeleteRequest();
  postMarketDeleteResponse: PostMarketDeleteResponse = new PostMarketDeleteResponse();
  getMarketRequest: GetMarketRequest = new GetMarketRequest();
  getMarketResponse: GetMarketResponse = new GetMarketResponse();
  getMarketListRequest: GetMarketListRequest = new GetMarketListRequest();
  getMarketListResponse: GetMarketListResponse = new GetMarketListResponse();
  role: string[];

  constructor(
    private router: Router,
    private titleService: Title,
    private route: ActivatedRoute,
    private marketService: MarketService,
    private dialog: MatDialog
  ) { }

  ngOnInit() {
    this.titleService.setTitle('DMS - Market Edit');

    this.role = ['ADMIN', 'PRINCIPAL', 'AREA', 'DISTRIBUTOR', 'SUBDIST', 'GROSIR', 'MOTORIST'];

    this.route.paramMap.subscribe(params => {
      this.postMarketEditRequest.tbmId = params.get('tbmId') == null ? '0' : params.get('tbmId');

      this.getMarket(this.postMarketEditRequest.tbmId);
    });

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

    this.marketService.postMarketEdit(this.postMarketEditRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.postMarketEditResponse = successResponse;

          this.util.showNotification('info', 'top', 'center', this.postMarketEditResponse.message);
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

  getMarket(tbmId: string) {
    this.clicked = !this.clicked;

    this.marketService.getMarket(tbmId, this.getMarketRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getMarketResponse = successResponse;

          this.postMarketEditRequest.tbmId = this.getMarketResponse.tbMarket.tbmId;
          this.postMarketEditRequest.tbmMarketId = this.getMarketResponse.tbMarket.tbmMarketId;
          this.postMarketEditRequest.tbmParentId = this.getMarketResponse.tbMarket.tbmParentId;
          this.postMarketEditRequest.tbmRole = this.getMarketResponse.tbMarket.tbmRole;

          this.postMarketDeleteRequest.tbmId = this.getMarketResponse.tbMarket.tbmId;
        },
        errorResponse => {
          this.clicked = !this.clicked;

          if (errorResponse.error.status === 403) {
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
