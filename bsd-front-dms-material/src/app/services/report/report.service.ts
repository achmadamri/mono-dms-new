import { Injectable, isDevMode } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Util } from 'app/util';
import { GetOrderListRequest } from './getorderlistrequest';
import { GetOrderListResponse } from './getorderlistresponse';
import { GetStockListRequest } from './getstocklistrequest';
import { GetStockListResponse } from './getstocklistresponse';
import { GetSalesListRequest } from './getsaleslistrequest';
import { GetSalesListResponse } from './getsaleslistresponse';
import { GetDashboardRequest } from './getdashboardrequest';
import { GetDashboardResponse } from './getdashboardresponse';
import { GetReportRequest } from './getreportrequest';
import { GetReportResponse } from './getreportresponse';

@Injectable({
  providedIn: 'root'
})
export class ReportService {
  util: Util = new Util();
  apiUrl = isDevMode() ? 'http://localhost:2085/report' : 'https://dms.id-trec.com/2085/report';

  constructor(private httpClient: HttpClient) { }  

  getDashboard(getDashboardRequest: GetDashboardRequest): Observable<GetDashboardResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'))
      .set('length', length.toString())
      ;

    return this.httpClient.get<GetDashboardResponse>(`${this.apiUrl}/getdashboard`, { headers, params });
  }

  getOrderList(brand: string, marketId: string, frontliner: string, orderNo: string, start: string, end: string, length: number, pageSize: number, pageIndex: number, getOrderListRequest: GetOrderListRequest): Observable<GetOrderListResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'))
      .set('length', length.toString())
      .set('pageSize', pageSize.toString())
      .set('pageIndex', pageIndex.toString())
      .set('orderNo', orderNo)
      .set('start', start)
      .set('end', end)
      .set('brand', brand)
      .set('marketId', marketId)
      .set('frontliner', frontliner)
      ;

    return this.httpClient.get<GetOrderListResponse>(`${this.apiUrl}/getorderlist`, { headers, params });
  }

  getStockList(brand: string, marketId: string, sku: string, item: string, length: number, pageSize: number, pageIndex: number, getStockListRequest: GetStockListRequest): Observable<GetStockListResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'))
      .set('length', length.toString())
      .set('pageSize', pageSize.toString())
      .set('pageIndex', pageIndex.toString())
      .set('sku', sku)
      .set('item', item)
      .set('brand', brand)
      .set('marketId', marketId)
      ;

    return this.httpClient.get<GetStockListResponse>(`${this.apiUrl}/getstocklist`, { headers, params });
  }

  getSalesList(brand: string, marketId: string, frontliner: string, orderNo: string, sku: string, start: string, end: string, length: number, pageSize: number, pageIndex: number, getSalesListRequest: GetSalesListRequest): Observable<GetSalesListResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'))
      .set('length', length.toString())
      .set('pageSize', pageSize.toString())
      .set('pageIndex', pageIndex.toString())
      .set('sku', sku)
      .set('orderNo', orderNo)
      .set('start', start)
      .set('end', end)
      .set('brand', brand)
      .set('marketId', marketId)
      .set('frontliner', frontliner)
      ;

    return this.httpClient.get<GetSalesListResponse>(`${this.apiUrl}/getsaleslist`, { headers, params });
  }

  getReport(getReportRequest: GetReportRequest): Observable<GetReportResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'))
      .set('length', length.toString())
      ;

    return this.httpClient.get<GetReportResponse>(`${this.apiUrl}/getreport`, { headers, params });
  }
}
