import { Component, OnInit } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { GetMarketListRequest } from 'app/services/market/getmarketlistrequest';
import { GetMarketListResponse } from 'app/services/market/getmarketlistresponse';
import { MarketService } from 'app/services/market/market.service';
import { Util } from 'app/util';

@Component({
  selector: 'app-market',
  templateUrl: './market.component.html',
  styleUrls: ['./market.component.css']
})
export class MarketComponent implements OnInit {
  clicked = false;
  util: Util = new Util();
  length = 100;
  pageSize = 10;
  pageIndex = 0;
  pageSizeOptions: number[] = [5, 10, 25, 100];
  pageEvent: PageEvent;
  pageDisabled: boolean = false;
  getMarketListRequest: GetMarketListRequest = new GetMarketListRequest();
  getMarketListResponse: GetMarketListResponse = new GetMarketListResponse();
  role: string[];
  tbmMarket = "";

  constructor(
    private router: Router,
    private titleService: Title,
    private marketService: MarketService
  ) { }

  ngOnInit() {
    this.titleService.setTitle('DMS - Market');

    this.role = ['ADMIN', 'PRINCIPAL', 'DISTRIBUTOR', 'SUBDIST', 'GROSIR', 'MOTORIST'];

    this.getMarketList(null);
  }

  getMarketList(pageEvent: PageEvent) {
    this.clicked = !this.clicked;

    this.marketService.getMarketList(this.tbmMarket, pageEvent != null ? pageEvent.length : this.length, pageEvent != null ? pageEvent.pageSize : this.pageSize, pageEvent != null ? pageEvent.pageIndex : this.pageIndex, this.getMarketListRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getMarketListResponse = successResponse;

          this.length = this.getMarketListResponse.length;

          if (pageEvent != null) {
            this.length = pageEvent.length;
            this.pageSize = pageEvent.pageSize;
            this.pageIndex = pageEvent.pageIndex;
          }          
        },
        errorResponse => {
          this.length = 0;

          this.clicked = !this.clicked;
          
          this.getMarketListResponse = new GetMarketListResponse();
        }
      );
  }

  getPage(pageEvent: PageEvent) {
    this.getMarketList(pageEvent);
  }

  marketAdd() {
    this.router.navigate(['/market-add']);
  }

}
