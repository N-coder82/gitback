#!/bin/bash
revolver --style 'simpleDots' start 'Getting ready...'
sleep 3
revolver update 'Copying...'
sleep 3
revolver update 'Uploading...'
sleep 3
revolver update 'Cleaning up...'
sleep 3
revolver stop
echo Finished!
