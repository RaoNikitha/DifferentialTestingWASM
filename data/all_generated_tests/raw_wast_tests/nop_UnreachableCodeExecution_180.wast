;; 1. Test Description: Create a sequence of instructions including a `nop` followed directly by an `unreachable`. Check whether the control flow properly skips `nop` and immediately triggers the unreachable instruction.

(assert_invalid
  (module (func $test (nop) (unreachable)))
  "unreachable"
)