import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OrderUploadFileComponent } from './order-upload-file.component';

describe('OrderUploadFileComponent', () => {
  let component: OrderUploadFileComponent;
  let fixture: ComponentFixture<OrderUploadFileComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OrderUploadFileComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OrderUploadFileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
