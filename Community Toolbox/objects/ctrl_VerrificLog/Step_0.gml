// maybe mixing tests loading and tests processing in a single object isn't *elegant*
// but I just want to release the damn thing at some point, and getting too focused
// on subject-to-change architectural details is getting me nowhere
// besides, surely open source contributions can fix it! 🙃

if (!loader.is_finished) {
    event_user(0); // process the loader phase
} else if (!runner.is_finished) {
    event_user(1); // process the runner phase
}
