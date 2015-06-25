var React = require('react');

module.exports = React.createClass({
    getInitialState: function(){
		return {
			events: this.props.events || []
		}
	},
    handleItemClick: function(data){
        console.log('handleItemClick');
        console.log(data);
    },
    render: function(){
        var createItem = function(item){
            var formatDate = function(data_string){
                var d = new Date(data_string);
                return d.getFullYear() + '-' + d.getMonth() + '-' + d.getDate();
            }
            item.create_time = formatDate(item.create_time)
            return (
                <div onClick={this.handleItemClick.bind(this, item)} className="item">
                    <div className="col-category">{item.category}</div>
                    <div className="col-action">{item.action}</div>
                    <div className="col-ip">{item.ip}</div>
                    <div className="col-create_time">{item.create_time}</div>
                </div>
            );

        };

        return(
            <div className="conponent-EventList">
                {this.props.events.map(createItem.bind(this))}
            </div>
        );
    }
});
