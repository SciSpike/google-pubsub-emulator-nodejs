#!/usr/bin/env node
const { PubSub } = require('@google-cloud/pubsub')

process.env.GCLOUD_PROJECT = process.env.GCLOUD_PROJECT || 'sandbox'
console.log(`GCLOUD_PROJECT=${process.env.GCLOUD_PROJECT}`)

process.env.PUBSUB_PORT = process.env.PUBSUB_PORT || '8085'
console.log(`PUBSUB_PORT=${process.env.PUBSUB_PORT}`)

process.env.PUBSUB_EMULATOR_HOST = process.env.PUBSUB_EMULATOR_HOST || `localhost:${process.env.PUBSUB_PORT}`
console.log(`PUBSUB_EMULATOR_HOST=${process.env.PUBSUB_EMULATOR_HOST}`)

const pubSub = new PubSub({projectId: process.env.GCLOUD_PROJECT})

const fn = require('/startup')
fn(pubSub)
