//overview


class FollowToggle {
   constructor(el) {
       this.$el = $(el)
       this.userId = this.$el.data("user-id")
       this.current_userId = this.$el.data("current-user-id")
       this.followState = this.$el.data("initial-follow-state") === "true" ? true : false;
       this.render();
        this.handleClick();
       console.log(`userid:${this.userId}`)
       console.log(`current:${this.current_userId}`)
    }

    // const $el = $(".follow-toggle")
    // console.log($el)
    render() {
        if(this.followState){
            this.$el.text('unfollow!');
        }else{
            this.$el.text('follow!');
        }
    }

    handleClick(){
        this.$el.on('click', e => {
            e.preventDefault();
            if(this.followState){
                $.ajax({
                    method:"delete",
                    url: `/users/${this.userId}/follow`,
                    data: {
                        follow: {
                            followee_id: this.current_userId,
                        }
                    },
                    dataType: 'JSON',
                }).then(res => console.log(res))
                  .fail(res => console.log(res));
                  this.followState = false;

            }else{
                $.ajax({
                    method:"post",
                    url: `/users/${this.userId}/follow`,
                    data: {
                        follow: {
                            followee_id: this.current_userId,
                        }
                    },
                    dataType: 'JSON',
                }).then(res => console.log(res))
                .fail(res => console.log(res))
                this.followState= true;

            }
        })
    }

}


module.exports = FollowToggle;