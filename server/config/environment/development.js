'use strict';

// Development specific configuration
// ==================================
module.exports = {
  // MongoDB connection options
  mongo: {
    uri: MONGOLAB_URI || 'mongodb://localhost/qiitenai-dev'
  },

  seedDB: true
};
