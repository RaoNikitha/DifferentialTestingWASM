;; 6. **Test 6**: Construct a `try-catch` block with multiple `nop` instructions preceding an `unreachable` within the `catch` clause to ensure proper handling of exceptions and that the `unreachable` is triggered correctly during error conditions.

(assert_invalid
  (module 
    (func 
      (try 
        (do 
          nop 
          nop) 
        (catch 
          (nop) 
          (unreachable)))))
  "unreachable operation not handled properly"
)