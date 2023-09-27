import { Routes } from '@angular/router';

import { AuthGuard } from '../../auth.guard';
import { DashboardComponent } from '../../dashboard/dashboard.component';
import { UserProfileComponent } from '../../user-profile/user-profile.component';
import { UserLoginComponent } from '../../user-login/user-login.component';
import { OrderComponent } from 'app/order/order.component';
import { OrderUploadFileComponent } from 'app/order-upload-file/order-upload-file.component';
import { OrderAddComponent } from 'app/order-add/order-add.component';
import { OrderEditComponent } from 'app/order-edit/order-edit.component';
import { ProductComponent } from 'app/product/product.component';
import { ProductAddComponent } from 'app/product-add/product-add.component';
import { ProductEditComponent } from 'app/product-edit/product-edit.component';
import { GwpComponent } from 'app/gwp/gwp.component';
import { GwpAddComponent } from 'app/gwp-add/gwp-add.component';
import { GwpEditComponent } from 'app/gwp-edit/gwp-edit.component';
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

export const AdminLayoutRoutes: Routes = [
    { path: 'dashboard',                       component: DashboardComponent, canActivate: [AuthGuard] },
    { path: 'user-profile',                    component: UserProfileComponent, canActivate: [AuthGuard] },
    { path: 'order-edit/:tboId',               component: OrderEditComponent, canActivate: [AuthGuard] },
    { path: 'order-edit',                      component: OrderEditComponent, canActivate: [AuthGuard] },
    { path: 'product-edit/:tbpId',             component: ProductEditComponent, canActivate: [AuthGuard] },
    { path: 'product-edit',                    component: ProductEditComponent, canActivate: [AuthGuard] },
    { path: 'order-add',                       component: OrderAddComponent, canActivate: [AuthGuard] },
    { path: 'order-manual',                    component: OrderManualComponent, canActivate: [AuthGuard] },
    { path: 'product-add',                     component: ProductAddComponent, canActivate: [AuthGuard] },
    { path: 'order',                           component: OrderComponent, canActivate: [AuthGuard] },
    { path: 'confirm',                         component: ConfirmComponent, canActivate: [AuthGuard] },
    { path: 'confirm-details/:tboOrderNo',     component: ConfirmDetailsComponent, canActivate: [AuthGuard] },
    { path: 'confirm-details',                 component: ConfirmDetailsComponent, canActivate: [AuthGuard] },
    { path: 'packing',                         component: PackingComponent, canActivate: [AuthGuard] },    
    { path: 'report',                          component: ReportComponent, canActivate: [AuthGuard] },    
    { path: 'product',                         component: ProductComponent, canActivate: [AuthGuard] }, 
    { path: 'market',                          component: MarketComponent, canActivate: [AuthGuard] },
    { path: 'market-add',                      component: MarketAddComponent, canActivate: [AuthGuard] },
    { path: 'market-edit/:tbmId',              component: MarketEditComponent, canActivate: [AuthGuard] },
    { path: 'market-edit',                     component: MarketEditComponent, canActivate: [AuthGuard] },
    { path: 'gwp',                             component: GwpComponent, canActivate: [AuthGuard] },
    { path: 'user',                            component: UserComponent, canActivate: [AuthGuard] },
    { path: 'user-add',                        component: UserAddComponent, canActivate: [AuthGuard] },    
    { path: 'user-edit/:tbuId',                component: UserEditComponent, canActivate: [AuthGuard] },
    { path: 'user-edit',                       component: UserEditComponent, canActivate: [AuthGuard] },
    { path: 'gwp-add',                         component: GwpAddComponent, canActivate: [AuthGuard] },
    { path: 'gwp-edit/:tbgId',                 component: GwpEditComponent, canActivate: [AuthGuard] },
    { path: 'gwp-edit',                        component: GwpEditComponent, canActivate: [AuthGuard] },
    { path: 'product-upload-file',             component: ProductUploadFileComponent, canActivate: [AuthGuard] },
    { path: 'product-bundle-upload-file',      component: ProductBundleUploadFileComponent, canActivate: [AuthGuard] },
    { path: 'order-upload-file',               component: OrderUploadFileComponent, canActivate: [AuthGuard] },
    { path: 'user-login',                      component: UserLoginComponent },
];
