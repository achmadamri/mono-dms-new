import { Component, OnInit } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { PostUploadProductRequest } from 'app/services/product/postuploadproductrequest';
import { PostUploadProductResponse } from 'app/services/product/postuploadproductresponse';
import { ProductService } from 'app/services/product/product.service';
import { Util } from 'app/util';
import { Location } from '@angular/common';

@Component({
  selector: 'app-product-upload-file',
  templateUrl: './product-upload-file.component.html',
})
export class ProductUploadFileComponent implements OnInit {
  clicked = false;
  util: Util = new Util();
  length = 100;
  pageSize = 10;
  pageSizeOptions: number[] = [5, 10, 25, 100];
  pageEvent: PageEvent;
  pageDisabled: boolean = false;
  selectedFile: File;
  postUploadProductRequest: PostUploadProductRequest = new PostUploadProductRequest();
  postUploadProductResponse: PostUploadProductResponse = new PostUploadProductResponse();

  constructor(
    private location: Location,
    private router: Router,
    private titleService: Title,
    private productService: ProductService
  ) { }

  ngOnInit() {
    this.titleService.setTitle('DMS - Product Upload File');
  }

  onFileChanged(event) {
    this.selectedFile = event.target.files[0];
  }

  upload() {
    this.clicked = !this.clicked;

    if (this.selectedFile == null) {
      this.clicked = !this.clicked;

      this.util.showNotification('info', 'top', 'center', 'No file selected');      
    } else {
      const reader = new FileReader();
      reader.readAsDataURL(this.selectedFile);
  
      this.util.showNotification('info', 'top', 'center', 'Uploading ' + this.selectedFile.name);
  
      this.productService.postUploadProduct(this.postUploadProductRequest, this.selectedFile)
        .subscribe(
          successResponse => {
            this.clicked = !this.clicked;
  
            this.postUploadProductResponse = successResponse;
  
            this.util.showNotification('info', 'top', 'center', this.postUploadProductResponse.message);

            this.router.navigate(['/product']);
          },
          errorResponse => {
            this.clicked = !this.clicked;
  
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);
  
            if (errorResponse.error.status === 403) {
              this.router.navigate(['/user-login']);
            }
          }
        );
    }
  }

  back() {
    this.location.back();
  }

}
