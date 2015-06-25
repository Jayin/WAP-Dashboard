var React = require('react');

module.exports = React.createClass({
    getInitialState: function(){
		return {
			websites: this.props.websites || []
		}
	},
    handleItemClick: function(data){
        console.log('handleItemClick');
        console.log(data);
    },
    render: function(){
        var createItem = function(item){
            return (
                <div onClick={this.handleItemClick.bind(this, item)} className="btn-tst">
                    <a href={item.domain} target="_blank">{item.domain}</a>
                    <div>{item.app_key}</div>
                    <div>{item.create_time}</div>
                </div>
            )

        };

        return(
            <div className="conponent-WebsiteList">
                {this.state.websites.map(createItem.bind(this))}
            </div>
        )
    }
});