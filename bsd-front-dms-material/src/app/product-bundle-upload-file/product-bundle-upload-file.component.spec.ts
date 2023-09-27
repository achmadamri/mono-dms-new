import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductBundleUploadFileComponent } from './product-bundle-upload-file.component';

describe('ProductBundleUploadFileComponent', () => {
  let component: ProductBundleUploadFileComponent;
  let fixture: ComponentFixture<ProductBundleUploadFileComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProductBundleUploadFileComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProductBundleUploadFileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
