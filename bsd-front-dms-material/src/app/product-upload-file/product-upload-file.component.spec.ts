import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductUploadFileComponent } from './product-upload-file.component';

describe('ProductUploadFileComponent', () => {
  let component: ProductUploadFileComponent;
  let fixture: ComponentFixture<ProductUploadFileComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProductUploadFileComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProductUploadFileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
