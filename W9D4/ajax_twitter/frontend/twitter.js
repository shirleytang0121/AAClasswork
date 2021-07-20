const FollowToggle = require("./follow_toggle");

const jQueryStuff = () => {
    const $buttons = $(".follow-toggle")
    $buttons.each( (idx, el) => new FollowToggle(el) )

    //all code goes in here
}

$(jQueryStuff);