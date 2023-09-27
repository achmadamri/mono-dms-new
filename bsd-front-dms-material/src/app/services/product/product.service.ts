import { Injectable, isDevMode } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Util } from 'app/util';
import { GetProductListRequest } from './getproductlistrequest';
import { GetProductListResponse } from './getproductlistresponse';
import { PostProductAddRequest } from './postproductaddrequest';
import { PostProductAddResponse } from './postproductaddresponse';
import { PostProductEditRequest } from './postproducteditrequest';
import { PostProductEditResponse } from './postproducteditresponse';
import { GetProductRequest } from './getproductrequest';
import { GetProductResponse } from './getproductresponse';
import { PostProductDeleteRequest } from './postproductdeleterequest';
import { PostProductDeleteResponse } from './postproductdeleteresponse';
import { GetBrandRequest } from './getbrandrequest';
import { GetBrandResponse } from './getbrandresponse';
import { PostUploadProductRequest } from './postuploadproductrequest';
import { PostUploadProductResponse } from './postuploadproductresponse';
import { PostUploadProductBundleRequest } from './postuploadproductbundlerequest';
import { PostUploadProductBundleResponse } from './postuploadproductbundleresponse';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  util: Util = new Util();
  apiUrl = isDevMode() ? 'http://localhost:2084/product' : 'https://dms.id-trec.com/2084/product';

  constructor(private httpClient: HttpClient) { }

  postUploadProductBundle(PostUploadProductBundleRequest: PostUploadProductBundleRequest, selectedFile: File): Observable<PostUploadProductBundleResponse> {
    const headers = new HttpHeaders()
      .set('asd', 'asd');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'));

    const formData = new FormData();
    formData.append('file', selectedFile, selectedFile.name);

    return this.httpClient.post<PostUploadProductResponse>(`${this.apiUrl}/postuploadproductbundle`, formData, { headers, params });
  }

  postUploadProduct(PostUploadProductRequest: PostUploadProductRequest, selectedFile: File): Observable<PostUploadProductResponse> {
    const headers = new HttpHeaders()
      .set('asd', 'asd');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'));

    const formData = new FormData();
    formData.append('file', selectedFile, selectedFile.name);

    return this.httpClient.post<PostUploadProductResponse>(`${this.apiUrl}/postuploadproduct`, formData, { headers, params });
  }

  getProductList(brand: string, sku: string, item: string, code: string, type: string, length: number, pageSize: number, pageIndex: number, getProductListRequest: GetProductListRequest): Observable<GetProductListResponse> {
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
      .set('brand', brand)
      .set('sku', sku)
      .set('item', item)
      .set('code', code)
      .set('type', type)
      ;

    return this.httpClient.get<GetProductListResponse>(`${this.apiUrl}/getproductlist`, { headers, params });
  }

  postProductAdd(postProductAddRequest: PostProductAddRequest): Observable<PostProductAddResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    postProductAddRequest.email = localStorage.getItem('email');
    postProductAddRequest.token = localStorage.getItem('token');
    postProductAddRequest.requestId = this.util.randomString(10);
    postProductAddRequest.requestDate = ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000';

    return this.httpClient.post<PostProductAddResponse>(`${this.apiUrl}/postproductadd`, postProductAddRequest, { headers });
  }

  getBrand(getBrandRequest: GetBrandRequest): Observable<GetBrandResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'));

    return this.httpClient.get<GetBrandResponse>(`${this.apiUrl}/getbrand`, { headers, params });
  }

  postProductEdit(postProductEditRequest: PostProductEditRequest): Observable<PostProductEditResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    postProductEditRequest.email = localStorage.getItem('email');
    postProductEditRequest.token = localStorage.getItem('token');
    postProductEditRequest.requestId = this.util.randomString(10);
    postProductEditRequest.requestDate = ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000';

    return this.httpClient.post<PostProductEditResponse>(`${this.apiUrl}/postproductedit`, postProductEditRequest, { headers });
  }

  postProductDelete(postProductDeleteRequest: PostProductDeleteRequest): Observable<PostProductDeleteResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    postProductDeleteRequest.email = localStorage.getItem('email');
    postProductDeleteRequest.token = localStorage.getItem('token');
    postProductDeleteRequest.requestId = this.util.randomString(10);
    postProductDeleteRequest.requestDate = ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000';

    return this.httpClient.post<PostProductDeleteResponse>(`${this.apiUrl}/postproductdelete`, postProductDeleteRequest, { headers });
  }

  getProduct(tbpIdSkuCode: string, getProductRequest: GetProductRequest): Observable<GetProductResponse> {
    const headers = new HttpHeaders()
      .set('Content-Type', 'application/json');

    const params = new HttpParams()
      .set('requestId', this.util.randomString(10))
      .set('requestDate', ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000')
      .set('email', localStorage.getItem('email'))
      .set('token', localStorage.getItem('token'))
      .set('length', length.toString())
      .set('tbpIdSkuCode', tbpIdSkuCode)
      ;

    return this.httpClient.get<GetProductResponse>(`${this.apiUrl}/getproduct`, { headers, params });
  }
}
