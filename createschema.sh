#!/usr/bin/bash

su - penske -c "db2 terminate &&
                db2 deactivate db penske &&
                db2 restore db penske from /backup replace existing &&
                db2 rollforward db penske complete"