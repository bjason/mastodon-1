import api from '../api';

export const GLOBAL_MUTE_WORDS_FETCH_REQUEST = 'GLOBAL_MUTE_WORDS_FETCH_REQUEST';
export const GLOBAL_MUTE_WORDS_FETCH_SUCCESS = 'GLOBAL_MUTE_WORDS_FETCH_SUCCESS';
export const GLOBAL_MUTE_WORDS_FETCH_FAIL    = 'GLOBAL_MUTE_WORDS_FETCH_FAIL';

export const fetchGlobalMuteWords = () => (dispatch, getState) => {
  dispatch({
    type: GLOBAL_MUTE_WORDS_FETCH_REQUEST,
    skipLoading: true,
  });

  api(getState)
    .get('/api/v1/global_mute_words')
    .then(({ data }) => dispatch({
      type: GLOBAL_MUTE_WORDS_FETCH_SUCCESS,
      global_mute_words: data,
      skipLoading: true,
    }))
    .catch(err => dispatch({
      type: GLOBAL_MUTE_WORDS_FETCH_FAIL,
      err,
      skipLoading: true,
      skipAlert: true,
    }));
};
