<template>
    <form method="POST" action="/login" id="form_login">
        <input type="hidden" name="_token" v-model="csrf" />

        <div class="form-group row">
            <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>

            <div class="col-md-6">
                <input id="email" type="email" class="form-control" name="email" v-model="email" required autocomplete="email" autofocus>
            </div>
        </div>

        <div class="form-group row">
            <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>

            <div class="col-md-6">
                <input id="password" type="password" class="form-control" name="password" v-model="password" required autocomplete="current-password">
            </div>
        </div>

        <div class="form-group row mb-0">
            <div class="col-md-8 offset-md-4">
                <button type="button" class="btn btn-primary" @click="submit">
                    Login
                </button>
            </div>
        </div>
    </form>
</template>

<script>
import VueCookie from 'vue-cookie';
export default {
    components: { VueCookie },
    name: "Login",
    data() {
        return {
            messages: [],
            csrf: '',
            remember_me: false,
            email: '',
            password: '',
            error: false,
            in_processing: false
        };
    },
    mounted() {
        this.csrf = $('meta[name="csrf-token"]')[0].content;
    },
    methods: {
        submit: function() {
            this.messages = [];
            if (this.email.length == 0 || this.password.length == 0) {
                this.error = true;
                this.error_message = 'Email and password are required';
                return;
            }
            this.error = false;
            this.in_processing = true;
            var self = this;
            this.$toast.info('Logging in');
            axios.post('/oauth/token', {
                username: this.email,
                password: this.password,
                client_id: 2,
                client_secret: 's6EbNKi1cuvZ0vchdyeXZhBKyIfc5TXpPOsJ7wCq',
                grant_type: 'password',
                scope: '*'
            }).then(response => {
                console.log(response);
                if(response.data.hasOwnProperty('access_token')) {
                    var access_token = response.data.access_token;
                    VueCookie.set('API_ACCESS_TOKEN', response.data.access_token);
                    // window.location.href = '/';
                    $('#form_login').submit();
                    this.$toast.success('Login successful. Redirecting');
                }
            }).catch(e => {
                self.in_processing = false;
                self.error = true;
                self.error_message = e.response.data.message;
                this.$toast.error('Incorrect credentials');
            })
        }
    }
}
</script>

<style scoped>

</style>
