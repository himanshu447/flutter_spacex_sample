
class EnumUtil {
	static T fromStringEnum<T>(Iterable<T> values, String stringType) {
		return values.firstWhere(
						(f) => "${f.toString().split('.').last}".toString() == stringType,
				orElse: () => null);
	}
	
	static String toStringEnum<T>(T enumType) {
		return enumType.toString().split('.').last;
	}
}

enum StoreState { initial, loading, loaded }

enum CapsuleStatus { active, destroyed, unknown, retired }