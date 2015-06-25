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
            return (
                <div onClick={this.handleItemClick.bind(this, item)} className="item">
                    <div>{item.category}</div>
                    <div>{item.action}</div>
                    <div>{item.ip}</div>
                    <div>{item.create_time}</div>
                </div>
            );

        };

        return(
            <div className="conponent-EventList">
                {this.state.events.map(createItem.bind(this))}
            </div>
        );
    }
});
