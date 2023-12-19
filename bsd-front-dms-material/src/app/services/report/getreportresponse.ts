import { TbUserMarket } from './tbusermarket';

export class GetReportResponse {
    requestId: string;
    requestDate: string;
    responseId: string;
    responseDate: string;
    status: string;
    error: string;
    message: string;    
    lstTbUserMarket;
    lstFrontliner;
}
