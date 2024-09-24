;; 1. Test a block containing a nested block where a `br` targets an index that erroneously forces the outer block to continue past its `end` having an `unreachable` as the first instruction outside. Verify the handling of nested label stack management and ensure `unreachable` isn't reached.

(assert_invalid
  (module
    (func $nested-block-test
      (block (block (br 1)) (unreachable))
    )
  )
  "unreachable executed"
)