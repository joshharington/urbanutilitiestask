<template>
    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">{{ title }}</div>

                    <div class="card-body">
                        <p v-if="items.length == 0 && isLoaded">There are no upcoming movies currently.</p>
                        <div class="row">
                            <div class="col-md-3 mb-3" v-for="(item, index) in items" >
                                <div class="card" v-if="(limit != null && limit > 0 && index < limit) || limit == null">
                                    <img :src="getImageUrl(item.poster_path)" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">{{ item.original_title }}</h5>
                                        <small class="text-muted">Release Date: {{ item.release_date }}</small>
                                        <p class="card-text">{{ item.overview }}</p>
                                        <div v-if="renderComponent && auth_check == '1'">
                                            <button v-if="watchlist.indexOf(item.id) == -1" @click="addToWatchList(item.id)" class="btn btn-primary">Add to Watchlist</button>
                                            <button v-if="watchlist.indexOf(item.id) > -1" @click="removeFromWatchList(item.id)" class="btn btn-danger">Remove to Watchlist</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import VueCookie from 'vue-cookie';

export default {
    components: {VueCookie},
    name: "MovieList",
    props: ['movie_image_base_url', 'title', 'endpoint', 'auth_check', 'limit'],
    data() {
        return {
            items: [],
            watchlist: [],
            isAuthenticated: false,
            isLoaded: false,
            renderComponent: false,
        };
    },
    mounted() {
        var api_access_token = VueCookie.get('API_ACCESS_TOKEN');
        this.headers = {'Authorization': 'Bearer ' + api_access_token, 'Accept': 'application/json'};

        this.loadData();
        this.loadWatchlist();
    }, methods: {
        loadData: function() {
            let self = this;
            axios.get(this.endpoint, {headers: this.headers}).then(response => {
                // get body data
                let data = response.data;
                console.log('response', data);

                if(data.hasOwnProperty("data")) {
                    self.items = data.data;
                }

                self.forceRerender();

                self.isLoaded = true;

            }, response => {
                // error callback
                console.log('e.response', response);
            });
        },
        loadWatchlist: function() {
            let self = this;
            axios.get('/api/watchlist', {headers: this.headers}).then(response => {
                // get body data
                let data = response.data;
                console.log('response', data);

                if(data.hasOwnProperty("watchlist")) {
                    self.watchlist = data.watchlist;
                }

                self.forceRerender();

                self.isLoaded = true;

            }, response => {
                // error callback
                console.log('e.response', response);
            });
        },
        addToWatchList(movie_id) {
            this.$toast.info("Adding to watchlist.");
            let self = this;
            axios.post('/api/watchlist', {movie_id: movie_id}, {headers: this.headers}).then((response) => {
                let data = response.data;
                console.log('response', data);

                self.$toast.success("Added to watchlist.");

                if(data.hasOwnProperty("watchlist")) {
                    self.watchlist = data.watchlist;
                }

                self.forceRerender();

                self.isLoaded = true;

            }, (error) => {
                self.$toast.error("Something went wrong. Please try again later.");
                console.log('e.response', response);
            });
        },
        removeFromWatchList(movie_id) {
            this.$toast.info("Removing to watchlist.");
            let self = this;
            let url = '/api/watchlist/' + movie_id;
            axios.delete(url, {headers: this.headers}).then((response) => {
                let data = response.data;
                console.log('response', data);

                self.$toast.success("Removed from watchlist.");

                if(data.hasOwnProperty("watchlist")) {
                    self.watchlist = data.watchlist;
                }

                self.forceRerender();

                self.isLoaded = true;

            }, (error) => {
                self.$toast.error("Something went wrong. Please try again later.");
                console.log('e.response', response);
            });
        },
        getImageUrl: function(img_path) {
            return this.movie_image_base_url + img_path;
        },
        forceRerender() {
            // Remove my-component from the DOM
            this.renderComponent = false;

            this.$nextTick(() => {
                // Add the component back in
                this.renderComponent = true;
            });
        }
    },
}
</script>

<style scoped>

</style>
