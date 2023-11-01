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
	revenue: string;
	orderPending: string;
	orderDelivered: string;    
    lstDailySales: ViewOrder[] = Array(new ViewOrder());
    lstMarketPerformance: Object[] = Array(new Object());
    lstMarketStats: ViewOrder[] = Array(new ViewOrder());
    lstLowSku: TbProductMarket[] = Array(new TbProductMarket());
}
