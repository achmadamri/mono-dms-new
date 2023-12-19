import { TbProductMarket } from './tbproductmarket';
import { ViewOrder } from './vieworder';

export class GetDashboardResponse {
    requestId: string;
    requestDate: string;
    responseId: string;
    responseDate: string;
    status: string;
    error: string;
    message: string;
    sku: string;
	amount: string;
	orderPending: string;
	orderDelivered: string;    
    lstDailySales: ViewOrder[] = Array(new ViewOrder());
    lstMarketPerformance: ViewOrder[] = Array(new ViewOrder());
    lstMarketStats: ViewOrder[] = Array(new ViewOrder());
    lstLowSku: TbProductMarket[] = Array(new TbProductMarket());
}
