import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AdminLayoutRoutes } from './admin-layout.routing';
import { DashboardComponent } from '../../dashboard/dashboard.component';
import { UserProfileComponent } from '../../user-profile/user-profile.component';
import { UserLoginComponent } from '../../user-login/user-login.component';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatNativeDateModule, MatRippleModule } from '@angular/material/core';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatRadioModule } from '@angular/material/radio';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatAutocompleteModule } from '@angular/material/autocomplete'
import { MatPaginatorModule } from '@angular/material/paginator';
import { OrderComponent } from 'app/order/order.component';
import { OrderUploadFileComponent } from 'app/order-upload-file/order-upload-file.component';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { OrderAddComponent } from 'app/order-add/order-add.component';
import { OrderEditComponent } from 'app/order-edit/order-edit.component';
import { ProductComponent } from 'app/product/product.component';
import { ProductAddComponent } from 'app/product-add/product-add.component';
import { ProductEditComponent } from 'app/product-edit/product-edit.component';
import { GwpComponent } from 'app/gwp/gwp.component';
import { GwpAddComponent } from 'app/gwp-add/gwp-add.component';
import { GwpEditComponent } from 'app/gwp-edit/gwp-edit.component';
import { AutoFocusDirective } from 'app/autofocus.directive';
import { PackingComponent } from 'app/packing/packing.component';
import { OrderManualComponent } from 'app/order-manual/order-manual.component';
import { ConfirmComponent } from 'app/confirm/confirm.component';
import { ConfirmDetailsComponent } from 'app/confirm-details/confirm-details.component';
import { UserComponent } from 'app/user/user.component';
import { UserAddComponent } from 'app/user-add/user-add.component';
import { UserEditComponent } from 'app/user-edit/user-edit.component';
import { ProductUploadFileComponent } from 'app/product-upload-file/product-upload-file.component';
import { ReportComponent } from 'app/report/report.component';
import { ProductBundleUploadFileComponent } from 'app/product-bundle-upload-file/product-bundle-upload-file.component';
import { MarketComponent } from 'app/market/market.component';
import { MarketAddComponent } from 'app/market-add/market-add.component';
import { MarketEditComponent } from 'app/market-edit/market-edit.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(AdminLayoutRoutes),
    FormsModule,
    ReactiveFormsModule,
    MatPaginatorModule,
    MatButtonModule,
    MatRippleModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatAutocompleteModule,
    MatRadioModule,
    MatCheckboxModule,
    MatTooltipModule,
    MatProgressSpinnerModule,
  ],
  declarations: [
    DashboardComponent,
    UserProfileComponent,
    OrderAddComponent,
    OrderManualComponent,
    ProductAddComponent,
    MarketAddComponent,
    GwpAddComponent,
    UserAddComponent,
    GwpEditComponent,
    UserEditComponent,
    OrderEditComponent,
    ProductEditComponent,
    MarketEditComponent,
    OrderComponent,
    ReportComponent,
    ConfirmComponent,
    ConfirmDetailsComponent,
    PackingComponent,
    ProductComponent,
    MarketComponent,
    GwpComponent,
    UserComponent,
    OrderUploadFileComponent,
    ProductUploadFileComponent,
    ProductBundleUploadFileComponent,
    UserLoginComponent,
    AutoFocusDirective,
  ]
})

export class AdminLayoutModule {}
