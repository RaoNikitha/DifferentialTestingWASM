;; 3. Test with a sequence where `unreachable` is placed right before a deep nested `loop`, with consecutive `br` instructions expecting valid break targets. This validates that control flow correctly exits loops despite `unreachable`.

(assert_invalid
 (module (func $test-unreachable-before-deep-loop
   (unreachable)
   (loop (block (loop (block (br 3)))))
 ))
 "type mismatch"
)