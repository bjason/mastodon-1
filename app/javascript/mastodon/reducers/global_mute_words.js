import { GLOBAL_MUTE_WORDS_FETCH_SUCCESS } from '../actions/global_mute_words';
import { List as ImmutableList, fromJS } from 'immutable';

export default function global_mute_words(state = ImmutableList(), action) {
  switch(action.type) {
  case GLOBAL_MUTE_WORDS_FETCH_SUCCESS:
    return fromJS(action.global_mute_words);
  default:
    return state;
  }
};
