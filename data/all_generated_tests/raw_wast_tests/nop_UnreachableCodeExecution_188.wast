;; 9. Test Description: Insert `nop` within a try-catch construct followed by an `unreachable`. Confirm that no exception prevents reaching the `unreachable` and execution terminates as expected.

(assert_invalid
  (module (func (try (do (nop) (unreachable)) (catch_all (nop)))))
  "unreachable executed")