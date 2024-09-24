;; 7. **Test Description:**    Create a scenario where the main module calls an imported function, which in turn calls another imported function containing an `unreachable` instruction. Confirm that the trap propagates correctly through the call chain in both implementations.

 ;; (module
  (import "env" "unreachable_func" (func $unreachable_func))
  (import "env" "wrapper_func" (func $wrapper_func))
  (func $main
    (call $wrapper_func)
    (call $unreachable_func)
  )
)
;; Invocation of the main function should show differential behavior when unreachable instruction is present.