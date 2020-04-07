import React from 'react'
import Title from "../../shared/Title"
import HorizontalLine from '../../shared/HorizontalLine'

export default function Forms() {
    return (
        <div className="containerMain">
            <Title
                text="Forms"
            />
            <HorizontalLine />
            <div class="panel panel-default">
            <div class="panel-heading">Leadership Team Forms</div>
            {/* <ul class="list-group">
                <li class="list-group-item"><%= link_to 'Application', '/2019_LeaderTeam_Application.pdf', target: "_blank" %></li>
                <li class="list-group-item"><%= link_to 'Information', '/2019_LeaderTeamApplicationInformation.pdf', target: "_blank" %></li>
            </ul> */}
            </div>
            <div class="panel panel-default">
            <div class="panel-heading">Waitstaff Team Forms</div>
            {/* <ul class="list-group">
                <li class="list-group-item"><%= link_to 'Application', '/2020_Application for Wait Staff.doc', target: "_blank" %></li>
                <li class="list-group-item"><%= link_to 'Information', '/2020_Application Information for Wait Staff.doc', target: "_blank" %></li></li>
                <li class="list-group-item"><%= link_to 'Regulations', '/2020 Wait Staff Regulations.pdf', target: "_blank" %></li>
                <li class="list-group-item"><%= link_to 'Medical', '/2020_Emergency Medical Form for Wait Staff.doc', target: "_blank" %></li>
            </ul> */}
            </div>
            <div class="panel panel-default">
            <div class="panel-heading">Dining Hall Forms</div>
            {/* <ul class="list-group">
                <li class="list-group-item"><%= link_to 'Dietary Request Forms', '/2015_SpecialDietaryRequestForm.pdf', target: "_blank" %></li>
            </ul> */}
            </div>
            <div class="panel panel-default">
            <div class="panel-heading">Work Order Forms</div>
            {/* <ul class="list-group">
                <li class="list-group-item"><%= link_to 'Work Order Forms', '/WorkOrder.pdf', target: "_blank" %></li>
            </ul> */}
            </div>
        </div>
    )
}
