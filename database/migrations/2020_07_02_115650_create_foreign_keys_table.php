<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateForeignKeysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('log_activity', function(Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users')->onDelete('CASCADE')->onUpdate('CASCADE');
        });

        Schema::table('helps', function(Blueprint $table) {
            $table->foreign('organization_id')->references('id')->on('organizations');
        });

        Schema::table('hdevices', function(Blueprint $table) {
            $table->foreign('organization_id')->references('id')->on('organizations');
        });

        Schema::table('device_logs', function(Blueprint $table) {
            $table->foreign('hdevice_id')->references('id')->on('hdevices');
        });

        Schema::table('organization_users', function(Blueprint $table) {
            $table->foreign('organization_id')->references('id')->on('organizations');
        });

        Schema::table('organization_users', function(Blueprint $table) {
            $table->foreign('hdevice_id')->references('id')->on('hdevices');
        });

        Schema::table('members', function(Blueprint $table) {
            $table->foreign('organization_id')->references('id')->on('organizations');
        });

        Schema::table('member_logs', function(Blueprint $table) {
            $table->foreign('member_id')->references('id')->on('members');
        });

        Schema::table('organization_notification_logs', function(Blueprint $table) {
            $table->foreign('organization_id')->references('id')->on('organizations');
        });

        Schema::table('organization_notification_logs', function(Blueprint $table) {
            $table->foreign('member_id')->references('id')->on('members');
        });

        Schema::table('organization_user_login_histories', function(Blueprint $table) {
            $table->foreign('organization_user_id')->references('id')->on('organization_users');
        });

        Schema::table('organization_logs', function(Blueprint $table) {
            $table->foreign('organization_id')->references('id')->on('organizations');
        });

        Schema::table('organizations', function(Blueprint $table) {
            $table->foreign('location_id')->references('id')->on('location');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('log_activity', function(Blueprint $table){
            $table->dropForeign('log_activity_user_id_foreign');
        });

        Schema::table('helps', function(Blueprint $table){
            $table->dropForeign('helps_organization_id_foreign');
        });

        Schema::table('hdevices', function(Blueprint $table){
            $table->dropForeign('hdevices_organization_id_foreign');
        });

        Schema::table('device_logs', function(Blueprint $table){
            $table->dropForeign('device_logs_hdevice_id_foreign');
        });

        Schema::table('organization_users', function(Blueprint $table){
            $table->dropForeign('organization_users_organization_id_foreign');
        });

        Schema::table('organization_users', function(Blueprint $table){
            $table->dropForeign('organization_users_hdevice_id_foreign');
        });

        Schema::table('members', function(Blueprint $table){
            $table->dropForeign('members_organization_id_foreign');
        });

        Schema::table('member_logs', function(Blueprint $table){
            $table->dropForeign('member_logs_member_id_foreign');
        });

        Schema::table('organization_notification_logs', function(Blueprint $table){
            $table->dropForeign('organization_notification_logs_organization_id_foreign');
        });

        Schema::table('organization_notification_logs', function(Blueprint $table){
            $table->dropForeign('organization_notification_logs_member_id_foreign');
        });

        Schema::table('organization_user_login_histories', function(Blueprint $table){
            $table->dropForeign('organization_user_login_histories_organization_user_id_foreign');
        });

        Schema::table('organization_logs', function(Blueprint $table){
            $table->dropForeign('organization_logs_organization_id_foreign');
        });

        Schema::table('organizations', function(Blueprint $table){
            $table->dropForeign('organizations_location_id_foreign');
        });
    }
}
